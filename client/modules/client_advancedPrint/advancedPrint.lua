-------------
-- Private --
-------------

function _printOther(value, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(value), 'white')
end

function _printKeyString(key, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(key), '#a7994a')
end

function _printKeyNumber(key, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(key), '#c863d0')
end

function _printKey(key, space)
    space = space or ''

    if type(key) == 'string' then
        _printKeyString(key, space)
    elseif type(key) == 'number' then
        _printKeyNumber(key, space)
    else
        _printOther(key, space)
    end
end

function _printString(value, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(value), '#b26b45')
end

function _printNumber(value, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(value), '#86c996')
end

function _printBoolean(value, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(value), '#816dd2')
end

function _printNil(value, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(value), '#3d8cd0')
end

function _printTable(value, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(value), '#006600')
end

function _advancedPrintTable(list, space)
    space = space or ''

    for i,j in pairs(list) do
        _printKey(i, space)

        if type(j) == 'table' then
            _advancedPrintTable(j, space .. '  ')
        elseif type(j) == 'userdata' then
            _advancedPrintTable(getmetatable(j), space .. '  ')
        else
            _printValue(j, space)
        end
    end
end

function _printTableKeyValue(list, space)
    space = space or ''

    for i,j in pairs(list) do
        _printKey(i, space)
        _printValueNoRecursive(j, space)
    end
end

function _printFunction(value, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(value), '#bf3835')
end

function _printUserdata(value, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(value), '#f57f17')
end

function _printThread(value, space)
    space = space or ''
    modules.client_terminal.addLine(space .. tostring(value), '#a1887f')
end

function _printValue(value, space)
    space = space or ''

    if type(value) == 'string' then
        _printString(value, space)
    elseif type(value) == 'number' then
        _printNumber(value, space)
    elseif type(value) == 'boolean' then
        _printBoolean(value, space)
    elseif type(value) == 'nil' then
        _printNil(value, space)
    elseif type(value) == 'table' then
        _advancedPrintTable(value, space)
    elseif type(value) == 'function' then
        _printFunction(value, space)
    elseif type(value) == 'userdata' then
        _advancedPrintTable(getmetatable(value), space)
    elseif type(value) == 'thread' then
        _printThread(value, space)
    else
        _printOther(value, space)
    end
end

function _printValueNoRecursive(value, space)
    space = space or ''

    if type(value) == 'string' then
        _printString(value, space)
    elseif type(value) == 'number' then
        _printNumber(value, space)
    elseif type(value) == 'boolean' then
        _printBoolean(value, space)
    elseif type(value) == 'nil' then
        _printNil(value, space)
    elseif type(value) == 'table' then
        _printTable(value, space)
    elseif type(value) == 'function' then
        _printFunction(value, space)
    elseif type(value) == 'userdata' then
        _printUserdata(value, space)
    elseif type(value) == 'thread' then
        _printThread(value, space)
    else
        _printOther(value, space)
    end
end

------------
-- Public --
------------

function advancedPrint(value, recursive)
    if recursive == nil or recursive == true then
        recursive = true
    else
        recursive = false
    end

    if recursive then
        _printValue(value)
    else
        _printValueNoRecursive(value)
    end
end

function tableKaysPrint(value)
    _printTableKeyValue(value)
end

function tracebackPrint()
    modules.client_terminal.addLine(debug.traceback(), '#33CCFF')
end

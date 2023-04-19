local tutorialWindow = CreatureEvent("TutorialWindow")

function tutorialWindow.onLogout(player)
    player:unregisterEvent("TutorialWindow")
    return true
end

tutorialWindow:register()
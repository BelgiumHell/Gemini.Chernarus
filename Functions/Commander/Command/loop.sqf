/////////////////////////
//Script made by Jochem//
/////////////////////////
while{true}do{
    //Check for AA intercept
    if((count jetTargets > 0 || count heliTargets > 1) && !jetActive)then{
        jetActive = true;
        []spawn JOC_cmdAttackIntercept;
    };

    //Assault blufor positions

    sleep 60;
};

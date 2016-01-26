/////////////////////////
//Script made by Jochem//
/////////////////////////
while{true}do{
    //Check for AA intercept
    if(count airTargets > 1  && !jetActive)then{
        []spawn JOC_cmdAttackIntercept;
    };
    sleep 20;
};

%usr/bin/env matlab
%parpool(2)
fprintf("\nWelcome to ParPool Testing\n\n")

% Try with circe sbatch request some amount of devices
try
    parpool(2);
    f1 = parfeval(wait_5(), 1);
    f2 = parfeval(wait_4(), 1);

    % fetchNext waits for one of the functions to complete,
    % and also gets the result
    [idx, result] = fetchNext([f1, f2]);
    % We're done, so we can cancel f1 and f2 (one will actually already be complete)
    cancel([f1, f2]);
catch
    delete(gcp('nocreate'))
end

fprintf("\nFor parallel processing confirmation the winner should be #4\n\n")


function done = wait_5()
    pause(10)
    fprintf("\n5 is the winner!!!!!\n")
    done = 5;
end

function done = wait_4()
    pause(1)
    fprintf("\n4 is the winner!!!!!\n")
    done = 4;
end

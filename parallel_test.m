%usr/bin/env matlab
%parpool(2)
fprintf("Testing\n")

% Try with circe sbatch request some amount of devices

try
    parpool(2);
    f2 = parfeval(wait_4(), 1);
    f1 = parfeval(wait_5(), 1);

    % fetchNext waits for one of the functions to complete,
    % and also gets the result
    [idx, result] = fetchNext([f1, f2]);
    % We're done, so we can cancel f1 and f2 (one will actually already be complete)
    cancel([f1, f2]);
catch
    delete(gcp('nocreate'))
end


function done = wait_5()
    pause(10)
    fprintf("5 is the winner!!!!!")
    done = 5;
end

function done = wait_4()
    pause(1)
    fprintf("4 is the winner!!!!!")
    done = 4;
end

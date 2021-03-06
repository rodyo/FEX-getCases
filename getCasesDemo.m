% Demo for GETCASES().
%
% This function demonstrates how to use GETCASES(). You may check that the
% input


% Please report bugs and inquiries to:
%
% Name       : Rody P.S. Oldenhuis
% E-mail     : oldenhuis@gmail.com
% Licence    : 2-clause BSD (See license.txt)


% If you find this work useful, please consider a donation:
% https://www.paypal.me/RodyO/3.5


% Changelog
%{
2018/June
    Removed affiliation info & updated license

2017/September/08
    - Apparently, MATLAB no longer accepts function handles as cases in
      switch blocks; adjusted accordingly

2013/November/06
	- Initial version
%}
function getCasesDemo

    %#ok<*MDUPC>

    clc
    value = true;

    % You can use GETCASES() in a switch WITH an ''otherwise''
    switch value
        case false
        otherwise
            disp('The cases are:')
            cellfun(@disp, getCases())
    end
    disp(' ')

    % and a switch WITHOUT an ''otherwise''
    switch value
        case 'test'
            % GETCASES poses no limitations on how you code.
            if false
                % Nested control structure
            end

        case 'blah'

        case true
            disp('The cases are:')
            cellfun(@disp, getCases())
            disp(' ')

        % This case is included as well
        case {'test' '%\n%{'}

    end

    % You can really use it anywhere. In a sub function:
    subFunction();

    % Or a nested function:
    nestedFuntion();
    function nestedFuntion
        switch true
            case []
            case 'AnotherTest'
            case true
                if true % call from WITHIN nested control structure
                    disp('The cases are:')
                    cellfun(@disp, getCases())
                    disp(' ')
                end

            case 'TEST'
            otherwise
        end
    end

    % The 'eval' option can also be useful:
    switch value
        case cos(pi)
        case rand(1,2)
        case true
            disp('The cases are:')
            cellfun(@disp, getCases('eval'))
            disp(' ')
    end

    % But of course, it's only valid INSIDE a ''switch'' control structure:
    try
        getCases();
    catch ME
        warning(ME.message);
    end
    disp(' ')

    % Finally, since error messaging is expected to be the most common use
    % case, the 'error' option will pring a default error message listing
    % all the cases:
    switch value
        case uint8(9)
        case false
        otherwise
            try
                getCases('error');
            catch ME
                warning(ME.message);
            end
    end
    disp(' ')

end

% sub-function
function subFunction()
    switch true
        case {[]}
        case true
            if true % call from WITHIN nested control structure
                disp('The cases are:')
                cellfun(@disp, getCases())
                disp(' ')
            end
        case 'TEST'
        otherwise
    end
end

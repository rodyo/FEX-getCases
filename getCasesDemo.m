% Demo for GETCASES(). 
%
% This function demonstrates how to use GETCASES(). You may check that the
% input 


% Please report bugs and inquiries to: 
%
% Name       : Rody P.S. Oldenhuis
% E-mail     : oldenhuis@gmail.com    (personal)
%              oldenhuis@luxspace.lu  (professional)
% Affiliation: LuxSpace sàrl
% Licence    : GPL + anything implied by placing it on the FEX


% If you find this work useful, please consider a donation:
% https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=6G3S5UYM7HJ3N



% Changelog
%{
2013/November/06
	Initial version
%}
function getCasesDemo
    
    clc               
    value = true;
        
    % You can use GETCASES() in a switch WITH an ''otherwise''
    switch value
        case false
        otherwise 
            disp('The cases are:')
            cellfun(@disp, getCases)
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
            cellfun(@disp, getCases)
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
            case {@tan}
            case 'AnotherTest'
            case true
                if true % call from WITHIN nested control structure
                    disp('The cases are:')
                    cellfun(@disp, getCases)
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
    
    % Finally, since error messaging is expected to be the most common use case, 
    % the 'error' option will pring a default error message listing all the
    % cases: 
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
function subFunction
    switch true
        case {@cos}           
        case true
            if true % call from WITHIN nested control structure                
                disp('The cases are:')
                cellfun(@disp, getCases)
                disp(' ')
            end            
        case 'TEST'
        otherwise
    end
end

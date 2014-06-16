% Test function for GETCASES(). 
%
% This function demonstrates that GETCASES is pretty immune to variations
% in coding style, by presenting it with some pretty challening, yet still
% valid, MATLAB code. 
%
% WARNING: THIS CODE IS OBFUSCATED FOR A REASON! DON'T 'CORRECT' IT; THAT
% WOULD DESTROY IT'S PURPOSE


% Please report bugs and inquiries to: 
%
% Name       : Rody P.S. Oldenhuis
% E-mail     : oldenhuis@gmail.com    (personal)
%              oldenhuis@luxspace.lu  (professional)
% Affiliation: LuxSpace sàrl
% Licence    : BSD


% If you find this work useful, please consider a donation:
% https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=6G3S5UYM7HJ3N



% Changelog
%{
2013/November/06
	Concocted a few more challenges

2013/July
	Initial version
%}
function getCasesTester
    
% WARNING: THIS CODE IS OBFUSCATED FOR A REASON! DON'T 'CORRECT' IT; THAT
% WOULD DESTROY IT'S PURPOSE

    clc               
    value = true;
    
    %{  NOT a multiline comment (it just looks that way)
    %}
    
    %{
        a true multi line comment
    %}
    
    %{ NOT a multiline comment 
    %} (it just looks that way)
    
    
    % Switch WITH otherwise
    switch value
        case false
        otherwise  
            cases = getCases;
            disp('First challenge: should return ''false'':')
            cellfun(@disp, cases)
            disp(' ')
    end
    
    % Switch WITHOUT otherwise
    switch value
        
        case 'test'
            if false
                % nested control structure
            end
        case 'blah'
            
        case true            
            disp('Second challenge: should return ''test'' ''blah''  true  {''test'' ''%\n%{''}:')
            cases = getCases;
            cellfun(@disp, cases)
            disp(' ')
            
        case {'test' '%\n%{'} % this one should be included as well
            
    end
        
    % Calling INCORRECTLY from a nested function 
    function nestedFunction_WRONG %#ok<EMNST>
        %#eml
        switch false
            case true
            otherwise
        end
        % OUTSIDE the switch though
        cases = getCases;
    end
    
    disp('Third challenge: should give error (forcibly changed into warning):')
    try %#ok<EMTC>
        nestedFunction_WRONG();
    catch ME
        warning(ME.message);
    end
    disp(' ')
    
    
    
    % Calling correctly from a nested function 
    nestedFunction_correct();
    function nestedFunction_correct %#ok<EMNST>
        %#eml 
        
        % switch WITHOUT otherwise
        switch value
            case {@cos}
                if false
                    % nested control structure
                end
            case true
                disp('Fourth challenge: should give {@cos}  true  {}:')
                cases = getCases;
                cellfun(@disp, cases)
                disp(' ')
                
            case {}            
        end
    end
        
    % other specials: 
    
    %#ok 
    %#ok<ID>
    %#codegen
    %#eml
    
    %{
    #ok 
    #ok<ID>
    #codegen
    #eml    
    %}
    
    % Calling INCORRECTLY from a subfunction 
    disp('Fifth challenge: should give error (forcibly changed into warning):')    
    try %#ok<EMTC>
        subFunction_WRONG();
    catch ME
        warning(ME.message);
    end
    disp(' ')
        
    % Calling correctly from a subfunction 
    subFunction_correct();
    
            
    % The call might occur in a nested switch
    switch true
        case true
            
            % We might be dealing with code obfuscation
            if ~strcmp('otherwise WRONG',' switch WRONG'), switch value
                                        
                    % Some nasty cases:
                    case true % trailing comment that's harder to remove 
                        
                        % More regex tests
                        switchcaseotherwise = 5;
                        switch_case_otherwise = 5;
                        
                        % We might be dealing with nested switches
                        switch 'test'
                            case 'tesT' % switch WRONG
                            case 'blah1' %switch WRONG
                                
                                % we might be dealing with *doubly* nested switches
                                switch {@tan}
                                    case {@sin}
                                    otherwise%or comments directly after the keywords                                        
                                end
                                
                            % Some regex-unfriendly comments:
                            %otherwise
                            %case
                            %switch value
                            %end
                            
                            % Some other random weird stuff:
                            '%',switch value
                                case []
                            end
                            5;rand(4);switch value
                                case []
                            end
                            
                            % Or regex-unfriendly strings:
                            ' switch '
                            ' otherwise '
                            ' '; case 'blah2' % Bet you did't see this one 
                                
                            % another possible code obfuscation
                            disp test, otherwise%regex-unfriendly comments
                                disp('Seventh challenge: should give ''tesT''  ''blah1''  ''blah2'':')
                                cases = getCases;
                                cellfun(@disp, cases)
                                disp(' ')                                                           
                        end
                        
                    otherwise   
                        while ijk == 7, end                        
                end
            end
            
            % SEVERELY obfuscated versions of a switch
            % PLEASE, never ever write like this, anywhere!
            '''yes'' ''this'' ''is'' ''valid''';switch true,case {uint8(6) @(x)x.^2}, case true  %#ok<ALIGN,EMFH>
                disp('Eighth challenge: should give  {uint8(6) @(x)x.^2}  true:')
                cases = getCases;
                cellfun(@disp, cases)
                disp(' ')
            end
            
            
            
            % Fools are just so damn clever; MORE obfuscation!
            if ~strcmp('otherwise WRONG',' switch WRONG'), switch value  %#ok<ALIGN>
                                        
                    % Some nasty cases:
                    case {'test', '%' @cos}, case '%12.2f'%WITH trailing comment, of course
                        
                        
                    % some fun with line continuations
                    case ...  comments without percent signs
                         rand(4)
                    
                    % some more possible obfuscation  
                    case ...
                         rand(5),case 4
                     
                        % Some nested switches
                        switch 'test'
                            case 'test'
                                for ijk = 7
                                end
                            case 'blah'
                            % NOTE: only cases
                        end
                        
                        % SEVERELY obfuscated versions thereof. 
                        % PLEASE, never ever write like this, anywhere!
                        '''this'' ''is'' ''valid'''              ,switch true,case true,disp('I love illegible code'),end
                        ['''but''', '''really''', '''annoying'''];switch true,case true,disp('I love illegible code'),end
                        
                    % Empties are always a great source of bugs
                    case {}
                        
                        switch false
                            case true
                                % for
                                % while
                                % if
                                % try
                            case rand(2)
                            otherwise                                
                        end
                    
                    % Finally, our relevant line
                    otherwise
                        if true
                            if true                                
                                    disp('Last challenge: should return an error message, ')
                                    disp(' containing  the cases  {''test'', ''%'' @cos}  ''%12.2f''   rand(4)     rand(5)    4   {}:')
                                    getCases('error');                                  
                            end
                            
                        end
                        
                        
                end, end% more obfuscation
            
        case false
            
    end    
end



% sub-function
function subFunction_WRONG %#eml
    switch false
        case true
        otherwise
    end
    % OUTSIDE the switch though
    cases = getCases;
end

%another sub-function; correct way
function subFunction_correct
    switch true
        case {@cos}
            if false
                % nested control structure
            end
        case true
            if true % call from WITHING nested control structure
                disp('Sixth challenge: should give {@cos} true ''TEST'':')
                cases = getCases;
                cellfun(@disp, cases)
                disp(' ')
            end
            
        case 'TEST'
        otherwise
    end
end

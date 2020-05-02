[![View Produce list of all cases in the current 'switch' block on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/44203-produce-list-of-all-cases-in-the-current-switch-block)

[![Donate to Rody](https://i.stack.imgur.com/bneea.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4M7RMVNMKAXXQ&source=url)

# FEX-getCases

GETCASES Return all cases handled by a switch structure
When called inside a 'switch', C = GETCASES() will return a cellstring C which contains all cases handled by that switch. This can be very useful when constructing error messages, for example:
switch value
case 1
%...
case 2
%...

case 3
%...

otherwise
C = getCases; % == {'1' '2' '3'}
error(['Invalid option: ''%d''. ',...
'Valid options are: ' C{:}], value);
end

Normally, the list of all cases handled by the switch needs to be maintained in two different places -- individual items next to all 'case' keywords, and a list of all items at the error message.

When new cases are added, old ones are removed or changed, it is all too easy to forget that the error message(s) need to be updated as well. Especially for large switch structures that handle many cases and have many actions per case, this often leads to situations where the error message(s) list a different set of cases than are actually handled.

GETCASES() automates this process by taking away the need to keep two separate, yet identical lists. It simply traverses the current 'switch' and identifies all different cases it encounters, collecting them in a cell string.

USAGE:

C = GETCASES() will return a cell string C containing all the cases handled by the corresponding switch, as they are written in the code.

C = GETCASES('eval') will return a cell string C containing all the cases handled by the corresponding switch, as they are seen by the 'case' keyword. In other words, they are passed through 'evalin' before adding them to the cellstring.

GETCASES('error') will issue a standard error, listing the given value at the switch, and all the valid cases as shown in the example above. The cases will be listed as they are written in the code.

GETCASES('eval', 'error') or GETCASES('error', 'eval') will do the same, except with the interpreted expressions (see 'eval' above). In both these use cases, there is no return argument.

GETCASES() may be called either from an ''otherwise'' block, or from a ''case'' field. In both cases, the complete list of cases is returned. GETCASES() will return an error message when it is called outside a
switch structure.

GETCASES() interprets the M-code its called from. That implies it cannot be used in MATLAB coder/Embedded MATLAB programs. It can also not be used when called from a switch defined on the MATLAB command line, or equivalently, called from code executed with 'Execute selection' (F9) or from cell mode (Ctrl+Enter).

If you like this work, please consider [a donation](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4M7RMVNMKAXXQ&source=url).

%DELLABLIST Delete a label list from dataset
%
%	B = DELLABLIST(A,LABLISTNAME)
%	B = DELLABLIST(A,LABLISTNUMBER)
%
% INPUT
%   A              - Dataset
%   LABLISTNAME    - String to identify the label list to be deleted
%   LABLISTNUMBER  - Number to identify the label list to be deleted
%
% OUTPUT
%   B              - Dataset
%
% DESCRIPTION
% In the multi-label system for datasets, additional labellings can be
% added by ADDLABELS. This is stored in the LABLIST and NLAB fields of
% the dataset. By this command, DELLABLIST such a labeling can be removed.
%
% SEE ALSO
% DATASETS, MULTI_LABELING, ADDLABELS, ADDLABLIST, CHANGELABLIST, CURLABLIST

% Copyright: R.P.W. Duin, r.p.w.duin@prtools.org
% Faculty EWI, Delft University of Technology
% P.O. Box 5031, 2600 GA Delft, The Netherlands

function a = dellablist(a,lablistname)
		prtrace(mfilename,2);
		
	if ~iscell(a.lablist) | size(a.lablist,1) == 2
		error('Last label list cannot be deleted')
	end
	
	[curn,curname] = curlablist(a);   % get current lablist
	a = changelablist(a,lablistname);
	n = curlablist(a);          % lablist to be deleted
	if curn == n                % compute new current lablist number
		newn = 1;                 % return to default if current is to be deleted
	elseif curn < n
		newn = curn;
	else
		newn = curn-1;
	end
	a.lablist(n,:) = [];
	a.lablist{end,1}(n,:) = [];
	a.lablist{end,2} = newn;
	a.nlab(:,n) = [];
		
	
	
return
	
	



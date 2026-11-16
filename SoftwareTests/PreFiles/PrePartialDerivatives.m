%  Pre-run script for PartialDerivativesSoln.m
% ---- Known Issues     -----
KnownIssuesID = "";
% ---- Pre-run commands -----
GetPosition = @(IdealEdge) GetPositionSpoofing(IdealEdge);


% <matlab:ShareFeedback Share your feedback>

function [Position,EdgeImage,ImageTitle] = GetPositionSpoofing(IdealEdge) % Function to call drawline
EdgeImage = imread(IdealEdge);
ImageTitle = "Image of "+erase(IdealEdge,".jpg");
Position=[87.06,158.06;239.89,155.36];
end

function [Position,EdgeImage,ImageTitle]= GetPosition(IdealEdge) % Function to call drawline
EdgeImage = imread(IdealEdge);

ImageTitle = erase(IdealEdge,".jpg");

if contains(ImageTitle, "Arm") || contains(ImageTitle, "Lung")
    ImageTitle = ImageTitle; % No change if it contains "Arm" or "Lung"
else
    ImageTitle = ImageTitle + " Edge"; % Append " Edge" otherwise
end
figure;
imshow(EdgeImage);
title("Image of "+ImageTitle)

h = drawline(Color=[0.3010 0.7450 0.9330]); % This needs a special test
uiwait(gcf,1)
if exist("h", "var") && isvalid(h)
    Position = h.Position; % Get position if h is valid
    delete(h.Parent.Parent);
    close(gcf);
else
    Position = [120,153.;270,153]; % Default position if figure was closed
    warning("Figure was closed before selecting a position. Default position assigned.");
    return
end
end


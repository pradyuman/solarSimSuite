function energy = solarInsolation(lat, tilt, hr, day)
Re = 6371 * 10 ^3; %Radius of the earth(m)
Ra = 100 * 10 ^ 3; %Max. Altitude in the atmosphere (Kármán line) (m)
Rt = Re + Ra; %Total earth-atmospher radius

%Determine if it is rotating or not
%If there are 5 arguments, it is the special case of a rotating panel
%If there are 4 arguments, it is the normal case
if nargin == 4
    %Calculates declination angle
    declination = 23.45 * sind(360 / 365 * (284 + day));
    %Calculates length of the day
    dayLength = 2 / 15 * acosd(-1 *(sind(lat)*sind(declination))/(cosd(lat) * cosd(declination)));
    %Calculates energy
    energy = 10.436 * sind(90 - lat + declination + tilt) * sind(180 / dayLength * (hr - 12 + (dayLength / 2)));
    %Adjust for atmospheric effects
    theta = 180 / dayLength * (hr - 12 + (dayLength / 2));
    atmos = ((Re * cosd(theta + 90)) + sqrt(Rt ^ 2 - Re ^ 2 * (sind(theta + 90)^2)))/(Rt-Re);
    energy = energy / atmos;
    %If energy is negative, set energy to 0
    if energy <= 0
        energy = 0;
    end
else
    %Calculates declination angle
    declination = 23.45 * sind(360 / 365 * (284 + day));
    %Calculates length of the day
    dayLength = 2 / 15 * acosd(-1 *(sind(lat)*sind(declination))/(cosd(lat) * cosd(declination)));
    %Calculates energy
    energy = 10.436;
    %Adjust for atmospheric effects
    theta = 180 / dayLength * (hr - 12 + (dayLength / 2));
    atmos = ((Re * cosd(theta + 90)) + sqrt(Rt ^ 2 - Re ^ 2 * (sind(theta + 90)^2)))/(Rt-Re);
    energy = energy / atmos;
    %If energy is negative, set energy to 0
    if energy <= 0
        energy = 0;
    end
end

function energy = solarInsolation(lat, tilt, hr, day)
declination = 23.45 * sind(360 / 365 * (284 + day));
dayLength = 2 / 15 * acosd(-1 *(sind(lat)*sind(declination))/(cosd(lat) * cosd(declination)));
energy = 10.436 * sind(90 - lat + declination + tilt) * sind(180 / dayLength * (hr - 12 + (dayLength / 2)));
if energy > 0
else
    energy = 0;
end
end

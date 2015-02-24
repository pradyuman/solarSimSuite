%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ENGR 13200 Spring 2015
%  Programmer(s) and Purdue Email Address(es):
%  1. Benjamin Staniewicz bstaniew@purdue.edu
%
%  Other Contributor(s) and Purdue Email Address(es):
%  1. pvig@purdue.edu
%  2. keller77@purdue.edu
%  3. chopra5@purdue.edu
%
%  Section #: 13     Team #: 18
%
%  Assignment #: Quantum Dot Modelling Draft 2
%
%  Academic Integrity Statement:
%
%       I/we have not used source code obtained from
%       any other unauthorized source, either modified
%       or unmodified.  Neither have I/we provided access
%       to my/our code to another. The project I/we am/are submitting
%       is my/our own original work.
%
%  Program Description: A user can input a desired effective band gap
%  energy. The user can then also input which 5 of the 10 materials are
%  available for mixing. This program will then minimize cost/toxicity/both
%  for that desired energy and print out not only the cost but also the mass 
%  percentages of each available material. It calculates the maximum by 
%  mixing every possible combination of two materials. It does this 10 times
%  until it then finds the minimal cost/toxicity/both of these 10 scenarios
%  and selects each of those options. 
%  
%  How to use: Input the desired band gap energy and also the accuracy you
%  would like the mass ratios to be in 2 decimal places is suggested as
%  more decimals require a longer computation time. This program will then
%  output the best cost, toxicity, and combination of both. Note that 
%  energies can not be made for above 1.8162eV or below 1.1878eV with the 
%  given materials.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear %clears workspace
clc %clears command window
% --- INPUTS ---

%Conversion constants
eV = 1.602 * 10^-19; %1 eV = 1.602 * 10^-19 J
nm = 10^-9; % 1 nm = 10^ -9 m

%Universal Constants
PLANCK = 6.626 * 10^-34; %Planck's constant
ELECTRON_MASS = 9.11 * 10^-31; %Mass of an electron in kg
ELECTRON_CHARGE = 1.602 * 10^-19; %Charge of an electron in C
PERM_FREESPACE = 8.854 * 10^-12; %Permittivity of free space in F * m^-1
PI = 3.14159; %Ratio of the circumference to diameter of a circle

%Constants in the scope of this problem
BULK_ENERGY = [1.92, 1.32, 1.5, 1.71, 1.18, 1.94, 1.26, 1.2, 1.82, 1.96, 1.95, 12.0]; %materials 1 - 12 bulk energies (eV)
DIELECTRIC = [3.6, 9.2, 4.0, 14.0, 7.0, 3.1, 7.6, 5.0, 2.9, 5.8, 3.2, 5.9]; %materials 1 - 12 dielectric constants
RADIUS = [4.5, 3.5, 1.5, 4.9, 2.7, 3.2, 2.8, 3.1, 1.2, 4.3, 2.8, 3.7]; %materials 1 - 12 radii
COST = [45, 35, 25, 40, 30, 30, 41, 22, 40, 18, 25, 0]; %materials 1-12 cost/g
TOXICITY = [2, 3, 4, 1, 2, 3, 2, 4, 3, 1, 2, 0]; %materials 1-12 toxicity impact/g

%User inputs
accuracy = .01; %this is the numer of decimals in the output masses (.01 = 2 decimal places)
desired_energy = 1.6; %This is the desired effective band gap energy of the material
materials_used = [1, 2, 3, 4, 5]; % user input the 5 materials being used (integers only, no repeats)

% --- CALCULATIONS ---

%Pre-Iteration Calculations
v = materials_used(1, 1); %number of one of five materials used
w = materials_used(1, 2); %number of one of five materials used
x = materials_used(1, 3); %number of one of five materials used 
y = materials_used(1, 4); %number of one of five materials used
z = materials_used(1, 5); %number of one of five materials used
mass = zeros(size(BULK_ENERGY)); %sets initial mass percent to all 0s
mass(1, v) = mass(1, v) + 2; %sets each of the user input rows to 2%
mass(1, w) = mass(1, w) + 2; %sets each of the user input rows to 2% 
mass(1, x) = mass(1, x) + 2; %sets each of the user input rows to 2%
mass(1, y) = mass(1, y) + 2; %sets each of the user input rows to 2%
mass(1, z) = mass(1, z) + 2; %sets each of the user input rows to 2%
mass1 = mass; %sets individual mass to the initial mass
mass2 = mass; %sets individual mass to the initial mass
mass3 = mass; %sets individual mass to the initial mass 
mass4 = mass; %sets individual mass to the initial mass
mass5 = mass; %sets individual mass to the initial mass
mass6 = mass; %sets individual mass to the initial mass
mass7 = mass; %sets individual mass to the initial mass
mass8 = mass; %sets individual mass to the initial mass
mass9 = mass; %sets individual mass to the initial mass
mass10 = mass; %sets individual mass to the initial mass
iterations = 0; %at start, no iterations have occured

%Convert bulk energy of a material to its nano particle counterpart
qdot_energy = BULK_ENERGY + (PLANCK ^ 2)./(4 * ELECTRON_MASS .* RADIUS .* RADIUS * nm .^ 2 * eV) - ((1.8 * ELECTRON_CHARGE ^ 2)./(4 * PI * PERM_FREESPACE .* DIELECTRIC .* eV .* RADIUS .* nm)); %converts the bulk energies to nano particle band gap energies

%Error "if statement"
%Determine max and min possible energies with given materials
bound_test = sort([qdot_energy(1, v), qdot_energy(1, w), qdot_energy(1, x), qdot_energy(1, y), qdot_energy(1, z)]); %orders the band gap energies of the materials being used
energy_max = (bound_test(1, 5) * 90 + 2 * sum(bound_test)) / 100; %finds max possible energy
energy_min = (bound_test(1, 1) * 90 + 2 * sum(bound_test)) / 100; %finds min possible energy

if (desired_energy > energy_max) | (desired_energy < energy_min) %these are not possible with the given materials
    fprintf('Error: energy not possible.\n') %prints an error statement
else %this activates when there is no error

% The following determine the best mixture between two different material 
% combinations for all possible combinations    
      
%Test 1: finds the optimal mixture between v, w
mass1(1, v) = 92; %sets one material to max possible percentage
test1_energy = dot(qdot_energy, mass1) / 100; %sets initial energy (unchanged mass)
while (abs(test1_energy - desired_energy) > .0001) & (mass1(1, v) > 2) %activates until one of them hits 2g or until desired=current energy
    mass1(1, v) = mass1(1, v) - accuracy; %subtracts  .01% from one of the materials
    mass1(1, w) = mass1(1, w) + accuracy;%adds .01% to the other material
    test1_energy = dot(qdot_energy, mass1) / 100; %calculates energy based on changed mass
    iterations = iterations + 1;%counts the number of iterations
end
    
%Test 2: finds the optimal mixture between v, x
mass2(1, v) = 92; %sets one material to max possible percentage
test2_energy = dot(qdot_energy, mass2) / 100; %sets initial energy (unchanged mass)
while (abs(test1_energy - desired_energy) > .000001) & (mass2(1, v) > 2)%activates until one of them hits 2g or until desired=current energy
    mass2(1, v) = mass2(1, v) - accuracy;%subtracts  .01% from one of the materials
    mass2(1, x) = mass2(1, x) + accuracy;%adds .01% to the other material
    test2_energy = dot(qdot_energy, mass2) / 100; %calculates energy based on changed mass
    iterations = iterations + 1;%counts the number of iterations
end
    
%Test 3: finds the optimal mixture between v, y
mass3(1, v) = 92; %sets one material to max possible percentage
test3_energy = dot(qdot_energy, mass3) / 100; %sets initial energy (unchanged mass)
while (abs(test3_energy - desired_energy) > .0001) & (mass3(1, v) > 2)%activates until one of them hits 2g or until desired=current energy
    mass3(1, v) = mass3(1, v) - accuracy;%subtracts  .01% from one of the materials
    mass3(1, y) = mass3(1, y) + accuracy;%adds .01% to the other material
    test3_energy = dot(qdot_energy, mass3) / 100; %calculates energy based on changed mass
    iterations = iterations + 1;%counts the number of iterations
end

%Test 4: finds the optimal mixture between v, z
mass4(1, v) = 92; %sets one material to max possible percentage
test4_energy = dot(qdot_energy, mass4) / 100; %sets initial energy (unchanged mass)
while (abs(test4_energy - desired_energy) > .0001) & (mass4(1, v) > 2)%activates until one of them hits 2g or until desired=current energy
    mass4(1, v) = mass4(1, v) - accuracy;%subtracts  .01% from one of the materials
    mass4(1, z) = mass4(1, z) + accuracy;%adds .01% to the other material
    test4_energy = dot(qdot_energy, mass4) / 100; %calculates energy based on changed mass
    iterations = iterations + 1;%counts the number of iterations
end

%Test 5: finds the optimal mixture between w, x
mass5(1, w) = 92; %sets one material to max possible percentage
test5_energy = dot(qdot_energy, mass5) / 100; %sets initial energy (unchanged mass)
while (abs(test1_energy - desired_energy) > .0001) & (mass5(1, w) > 2)%activates until one of them hits 2g or until desired=current energy
    mass5(1, w) = mass5(1, w) - accuracy;%subtracts  .01% from one of the materials
    mass5(1, x) = mass5(1, x) + accuracy;%adds .01% to the other material
    test5_energy = dot(qdot_energy, mass5) / 100; %calculates energy based on changed mass
    iterations = iterations + 1; %counts the number of iterations
end

%Test 6: finds the optimal mixture between w, y
mass6(1, w) = 92; %sets one material to max possible percentage
test6_energy = dot(qdot_energy, mass6) / 100; %sets initial energy (unchanged mass)
while (abs(test6_energy - desired_energy) > .0001) & (mass6(1, w) > 2)%activates until one of them hits 2g or until desired=current energy
    mass6(1, w) = mass6(1, w) - accuracy;%subtracts  .01% from one of the materials
    mass6(1, y) = mass6(1, y) + accuracy;%adds .01% to the other material
    test6_energy = dot(qdot_energy, mass6) / 100; %calculates energy based on changed mass
    iterations = iterations + 1;%counts the number of iterations
end

%Test 7: finds the optimal mixture between w, z
mass7(1, w) = 92; %sets one material to max possible percentage
test7_energy = dot(qdot_energy, mass7) / 100; %sets initial energy (unchanged mass)
while (abs(test7_energy - desired_energy) > .0001) & (mass7(1, w) > 2)%activates until one of them hits 2g or until desired=current energy
    mass7(1, w) = mass7(1, w) - accuracy;%subtracts  .01% from one of the materials
    mass7(1, z) = mass7(1, z) + accuracy;%adds .01% to the other material
    test7_energy = dot(qdot_energy, mass7) / 100; %calculates energy based on changed mass
    iterations = iterations + 1;%counts the number of iterations
end

%Test 8: finds the optimal mixture between x, y
mass8(1, x) = 92; %sets one material to max possible percentage
test8_energy = dot(qdot_energy, mass8) / 100; %sets initial energy (unchanged mass)
while (abs(test8_energy - desired_energy) > .0001) & (mass8(1, x) > 2)%activates until one of them hits 2g or until desired=current energy
    mass8(1, x) = mass8(1, x) - accuracy;%subtracts  .01% from one of the materials
    mass8(1, y) = mass8(1, y) + accuracy;%adds .01% to the other material
    test8_energy = dot(qdot_energy, mass8) / 100; %calculates energy based on changed mass
    iterations = iterations + 1;%counts the number of iterations
end

%Test 9: finds the optimal mixture between x, z
mass9(1, x) = 92; %sets one material to max possible percentage
test9_energy = dot(qdot_energy, mass9) / 100; %sets initial energy (unchanged mass)
while (abs(test9_energy - desired_energy) > .0001) & (mass9(1, x) > 2)%activates until one of them hits 2g or until desired=current energy
    mass9(1, x) = mass9(1, x) - accuracy;%subtracts  .01% from one of the materials
    mass9(1, z) = mass9(1, z) + accuracy;%adds .01% to the other material
    test9_energy = dot(qdot_energy, mass9) / 100; %calculates energy based on changed mass
    iterations = iterations + 1;%counts the number of iterations
end

%Test 10: finds optimal mixture between y, z
mass10(1, y) = 92; %sets one material to max possible percentage
test10_energy = dot(qdot_energy, mass10) / 100; %sets initial energy (unchanged mass)
while (abs(test10_energy - desired_energy) > .0001) & (mass10(1, y) > 2)%activates until one of them hits 2g or until desired=current energy
    mass10(1, y) = mass10(1, y) - accuracy;%subtracts  .01% from one of the materials
    mass10(1, z) = mass10(1, z) + accuracy;%adds .01% to the other material
    test10_energy = dot(qdot_energy, mass10) / 100; %calculates energy based on changed mass
    iterations = iterations + 1;%counts the number of iterations
end


% Calculates the minimum cost and the mixture of that cost
test_energies = [test1_energy, test2_energy, test3_energy, test4_energy, test5_energy, test6_energy, test7_energy, test8_energy, test9_energy, test10_energy]; %sets all energies as an array
req_check = (abs(desired_energy - test_energies) < .02); %checks if ea. element meets req. energy or did not

test_cost1 = dot(mass1, COST); %calculates the cost for test 1
test_cost2 = dot(mass2, COST); %calculates the cost for test 2
test_cost3 = dot(mass3, COST); %calculates the cost for test 3
test_cost4 = dot(mass4, COST); %calculates the cost for test 4
test_cost5 = dot(mass5, COST); %calculates the cost for test 5
test_cost6 = dot(mass6, COST); %calculates the cost for test 6
test_cost7 = dot(mass7, COST); %calculates the cost for test 7
test_cost8 = dot(mass8, COST); %calculates the cost for test 8
test_cost9 = dot(mass9, COST); %calculates the cost for test 9
test_cost10 = dot(mass10, COST); %calculates the cost for test 10
test_costs = req_check .* [test_cost1, test_cost2, test_cost3, test_cost4, test_cost5, test_cost6, test_cost7, test_cost8, test_cost9, test_cost10]; %makes an array of tests costs (0 if energy did not meet req.)

nonzero_costs = test_costs(test_costs ~= 0); %removes the zeros from the array
all_masses_costs = [mass1; mass2; mass3; mass4; mass5; mass6; mass7; mass8; mass9; mass10];%makes a matrix with all mass percentages
ideal_mass_costs = all_masses_costs(find(min(nonzero_costs) == test_costs), :);%pulls out the column of that matrix that is minimal
min_cost = dot(COST, ideal_mass_costs(1,:)) / 100; %determines cost for this combination
min_cost_tox = dot(TOXICITY, ideal_mass_costs(1,:)); %determines toxicity for this combination

% Calculates the minimum toxicity and the mixture of that toxicity
test_tox1 = dot(mass1, TOXICITY); %calculates the toxicity for test 1
test_tox2 = dot(mass2, TOXICITY); %calculates the toxicity for test 2
test_tox3 = dot(mass3, TOXICITY); %calculates the toxicity for test 3
test_tox4 = dot(mass4, TOXICITY); %calculates the toxicity for test 4
test_tox5 = dot(mass5, TOXICITY); %calculates the toxicity for test 5
test_tox6 = dot(mass6, TOXICITY); %calculates the toxicity for test 6
test_tox7 = dot(mass7, TOXICITY); %calculates the toxicity for test 7
test_tox8 = dot(mass8, TOXICITY); %calculates the toxicity for test 8
test_tox9 = dot(mass9, TOXICITY); %calculates the toxicity for test 9
test_tox10 = dot(mass10, TOXICITY); %calculates the toxicity for test 10
test_toxs = req_check .* [test_tox1, test_tox2, test_tox3, test_tox4, test_tox5, test_tox6, test_tox7, test_tox8, test_tox9, test_tox10];%makes an array of tests costs (0 if energy did not meet req.)

nonzero_tox = test_toxs(test_toxs ~= 0);%removes the zeros from the array
all_masses_toxs = [mass1; mass2; mass3; mass4; mass5; mass6; mass7; mass8; mass9; mass10];%makes a matrix with all mass percentages
ideal_mass_toxs = all_masses_toxs(find(min(nonzero_tox) == test_toxs), :);%pulls out the column of that matrix that is minimal
min_tox = dot(TOXICITY, ideal_mass_toxs(1,:));%determines toxicity for this combination
min_tox_cost = dot(COST, ideal_mass_toxs(1,:)) / 100;%determines cost for this combination

% Calculates minimum of both combined
avrg_cost = (COST(1, v) + COST(1, w) + COST(1, x) + COST(1, y) + COST(1, z)) / 5; %finds average cost of the 5 materials tested
avrg_tox = (TOXICITY(1, v) + TOXICITY(1, w) + TOXICITY(1, x) + TOXICITY(1, y) + TOXICITY(1, z)) / 5; %finds average toxicity of the 5 materials tested
combination = (COST / avrg_cost) + (TOXICITY / avrg_tox); %calculates the 'combination', our definition fo min cost and tox
test_both1 = dot(mass1, combination); %calculates the combination for test 1
test_both2 = dot(mass2, combination);%calculates the combination for test 2
test_both3 = dot(mass3, combination);%calculates the combination for test 3
test_both4 = dot(mass4, combination);%calculates the combination for test 4
test_both5 = dot(mass5, combination);%calculates the combination for test 5
test_both6 = dot(mass6, combination);%calculates the combination for test 6
test_both7 = dot(mass7, combination);%calculates the combination for test 7
test_both8 = dot(mass8, combination);%calculates the combination for test 8
test_both9 = dot(mass9, combination);%calculates the combination for test 9
test_both10 = dot(mass10, combination);%calculates the combination for test 10
test_boths = req_check .* [test_both1, test_both2, test_both3, test_both4, test_both5, test_both6, test_both7, test_both8, test_both9, test_both10];%makes an array of tests costs (0 if energy did not meet req.)

nonzero_both = test_boths(test_boths ~= 0);%removes the zeros from the array
all_masses_both = [mass1; mass2; mass3; mass4; mass5; mass6; mass7; mass8; mass9; mass10];%makes a matrix with all mass percentages
ideal_mass_both = all_masses_both(find(min(nonzero_both) == test_boths), :);%pulls out the column of that matrix that is minimal
min_both = dot(combination, ideal_mass_both); %calculates minimum 'combination'

tox_both = dot(TOXICITY, ideal_mass_both(1,:));%determines toxicity for this combination
cost_both = dot(COST, ideal_mass_both(1,:)) / 100;%determines cost for this combination

%Checks for duplicate max/mins
error_test_cost = size(ideal_mass_costs); %if the first entry is a 2, there is a duplicate
error_test_tox = size(ideal_mass_toxs); %if the first entry is a 2, there is a duplicate
error_test_both = size(ideal_mass_both); %if the first entry is a 2, there is a duplicate

% --- OUTPUTS ---

fprintf('Materials available to mix: QD %.0f, QD %.0f, QD %.0f, QD  %.0f, and QD %.0f', v, w, x, y, z) %prints the names of the 5 materials being mixed
fprintf('\nThe desired effective quantum dot energy is %.3f eV.\n\n', desired_energy) %prints the requested energy
fprintf('-------------------------------------------- MINIMUM COST ----------------------------------------------------------\n') %border for formatting
fprintf('The minimum cost is $%.2f per gram.\n', min_cost) %prints the min cost
fprintf('The toxicity is %.2f impact.\n', min_cost_tox/100) %prints the tox of min cost
fprintf('This is achieved by mixing %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f and %.2f percent of each material where each \nmaterial is materials QD 1-12 respectively.\n', ideal_mass_costs(1, :)) %prints the ideal mass combination
fprintf('\n-------------------------------------------- MINIMUM TOXICITY ------------------------------------------------------\n') %border for formatting
fprintf('The minimum toxicity is %.2f impact.\n', min_tox/100) %prints the min tox
fprintf('The cost is $%.2f per gram.\n', min_tox_cost) %prints the cost for min tox
fprintf('This is achieved by mixing %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, and %.2f percent of each material where each \nmaterial is materials QD 1-12 respectively.\n\n', ideal_mass_toxs(1,:)) %prints the ideal mass combination
fprintf('-------------------------------------------- MINIMUM BOTH ----------------------------------------------------------\n') %border for formatting
fprintf('The minimum cost and toxicity is achieved by mixing %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, and %.2f percent of each material\nwhere each material is materials QD 1-12 respectively.\n', ideal_mass_both(1,:)) %prints the ideal mass combination
fprintf('The toxicity is %.2f impact.\n', tox_both/100) %prints the toxicity for min both
fprintf('The cost is $%.2f per gram.\n', cost_both) %prints the cost for min both
fprintf('-----------------------\nTotal iterations: %.0f\n-----------------------\n\n', iterations) %prints the # of iterations


%Prints additional message if there are multiple possible "optimal"
%solutions
if error_test_tox(1, 1) > 1 %activates if there are duplicates
    fprintf('---------------------------------IMPORTANT WARNING MESSAGE---------------------------------------------------------------------\n') %border for formatting
    fprintf('IMPORTANT: Minimum toxicity can be achieved using multiple material combinations\n\n') %Not an error message, just a note to the user that there are other possibilities and this is only 1
else %activates if only 1 minimum
end %ends tox if statement
if error_test_cost(1, 1) > 1 %activates if there are duplicates
    fprintf('---------------------------------IMPORTANT WARNING MESSAGE---------------------------------------------------------------------\n') %border for formatting
    fprintf('IMPORTANT: Minimum cost can be achieved using multiple material combinations\n\n') %Not an error message, just a note to the user that there are other possibilities and this is only 1
else %activates if only 1 minimum
end %ends cost if statement
if error_test_both(1, 1) > 1 %activates if there are duplicates
    fprintf('---------------------------------IMPORTANT WARNING MESSAGE---------------------------------------------------------------------\n') %border for formatting
    fprintf('IMPORTANT: Minimum tox/cost combination can be achieved using multiple material combinations\n\n') %Not an error message, just a note to the user that there are other possibilities and this is only 1
else %activates if only 1 minimum
end %ends cost/tox if statement

end %ends error if statement from the beginning 
    
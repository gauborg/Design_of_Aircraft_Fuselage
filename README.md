# Design of Aircraft Fuselage
The goal of this project is to arrive at an optimized shape and design of a skin-stiffener aircraft fuselage by varying different design parameters, given the applied design loads of 10,000 lb shear, 200,000 lb-in torque and 500,000 in-lb bending moment.

The design calculations include selection of material, finding the maximum bending stress acting on the stiffeners for given number of stiffeners, calculating the critical buckling stress for stiffeners, calculating the critical shear buckling stress for skin, number of stiffeners and stiffener spacing for a safe design. The fuselage section is to be designed for minimum weight while deciding design parameters such as Stiffener Cross-section Area, Stiffener Thickness, Number of stiffeners, Skin thickness

Design trade studies are carried out by varying these parameters with respect to one another. Parameters such as critical stresses, stiffener dimensions, critical stresses, safety factors are calculated. If the design passes the safety criteria, weight is calculated. Various trade studies are carried out keeping one parameter constant so as to observe the variations in other parameters. In the end, the minimum possible weight of the fuselage section for both metallic design and the composite design is determined.


The following design steps are followed while carrying out design iterations in Matlab:

1.	The very basic assumption or decision making comes in the first step itself when we have to choose the material for the fuselage and for the stiffeners. (Different materials are used in the aerospace industry. It is not necessary that the material for the fuselage skin has to be the same as the material for stiffeners. However, if our project, we will assume the same material for both the skin and the stiffeners.)
Mentioning properties such as Young’s Modulus E, compressive yield strength and density are crucial before proceeding to design calculations.
2.	We select Z stiffeners for our design. To proceed with the calculations, certain basic dimensions such as the stiffener thickness, stiffener cross-sectional area, skin thickness and number of stringers are specified.
3.	After specifying the stiffener thickness and area, it will be easy to calculate stiffener dimensions such as the web height and the flange length. (The assumption made here is that web length = 0.5 × flange length). These dimensions are later required for stiffener design specifications.
4.	The spacing between the stiffeners is calculated in this step by dividing the circumference of fuselage with the number of stiffeners.
5.	The stiffener crippling calculations are carried out in order to determine the minimum crippling stress under which the stiffener will cripple in bending. The assumptions made in this are that one edge of the Z section in free and hence the ke value is taken to be equal to 0.342. Needham’s method is used for calculating critical crippling stress.
6.	For determining critical buckling stress, we have to calculate first the critical slenderness ratio of the stiffener. For determining this, we first calculate the area moments of the Z-stiffener for given dimensions.
7.	Depending on the value of the critical slenderness ratio and the slenderness ratio of our stiffener, we calculate the critical buckling stress for the stiffener.
8.	After this, the critical skin shear buckling stress is calculated.
9.	Then we proceed to calculating the actual bending stresses in the stiffeners and the actual shear stresses in the skin using principles of shear flows for primary structures design.
10.	We calculate the safety factors for stiffeners and for the skin.
11.	If the safety factors for both of them are greater than 1, then only we calculate the weight of the fuselage.
12.	These operations are performed iteratively so as to try different combinations of stiffener cross-section areas, stiffener thicknesses, skins thicknesses and no. of stiffeners.
13.	As the last step, we determine the minimum weight out of these combinations.

# NGN stablecoin

## Functions

This code defines a function called
calculateCollateralAmount
that takes in a parameter
\_stablecoinAmount
of type
uint
(unsigned integer) and returns a value of type
uint
.

Inside the function, it first calls another function
getCollateralPrice()
to get the current price of a collateral asset. It then multiplies the
\_stablecoinAmount
parameter by a constant
COLLATERAL_DECIMAL
and divides the result by the
collateralprice
. The purpose of this calculation is to convert the
\_stablecoinAmount
into an equivalent amount of collateral asset based on the current price.

The
mul
and
div
functions are used to perform the multiplication and division operations respectively. The
mul
function multiplies two numbers and returns the result, while the
div
function divides the first number by the second number and returns the result.

Overall, this function is used to calculate the amount of collateral asset that needs to be provided as collateral for a given amount of stablecoin based on the current price of the collateral asset.

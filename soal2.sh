#!/bin/bash

awk '
{
	split($0, arr, ",")
	if (arr[7] == 2012) 
	{
		quantity[arr[1]] = (quantity[arr[1]] + arr[10])
	}
	if (arr[7] == 2012 && arr[1] == "United States")
	{
		productline[arr[4]] = (productline[arr[4]] + arr[10])
	}
	if (arr[7] == 2012 && arr[1] == "United States" && arr[4] == "Personal Accessories")
	{
		product1[arr[6]] = (product1[arr[6]] + arr[10]) 
	}
	if (arr[7] == 2012 && arr[1] == "United States" && arr[4] == "Camping Equipment")
	{
		product2[arr[6]] = (product2[arr[6]] + arr[10]) 
	}
	if (arr[7] == 2012 && arr[1] == "United States" && arr[4] == "Outdoor Protection")
	{
		product3[arr[6]] = (product3[arr[6]] + arr[10])
	}
}
END {
	maxq=0
	for (x in quantity)
   {
	if (quantity[x] > maxq)
	{
		maxq = quantity[x]
		country = x
	}
   }

print country, "with the sum of quantity:", maxq
print ""
maxp1=0
maxp2=0
maxp3=0
p1="a"
p2="a"
p3="a"
for (x in productline)
	{
		if (productline[x] > maxp1)
		{
			maxp3 = maxp2
			maxp2 = maxp1
			maxp1 = productline[x]
			p3 = p2
			p2 = p1
			p1 = x
		}
		else if (productline[x] > maxp2)
		{
			maxp3 = maxp2
			maxp2 = productline[x]
			p3 = p2
			p2 = x
		}
		else if (productline[x] > maxp3)
		{
			maxp3 = productline[x]
			p3=x
		}
	}

print "1.", p1, "with the sum of quantity as big as: ", maxp1
print "2.", p2, "with the sum of quantity as big as: ", maxp2
print "3.", p3, "with the sum of quantity as big as: ", maxp3
print ""
prod1="a"
prod2="a"
prod3="a"
maxprod1=0
maxprod2=0
maxprod3=0
for (x in product1)
{
	if (product1[x] > maxprod1) {
		maxprod1 = product1[x]
		prod1 = x
	}
}
for (x in product2)
{
	if (product2[x] > maxprod2) {
		maxprod2 = product2[x]
		prod2 = x
	}
}
for (x in product3)
{
	if (product3[x] > maxprod3) {
		maxprod3 = product3[x]
		prod3 = x
	}
}
print "Personal Accesories: ", prod1, "with the sum of quantity of: ", maxprod1
print "Camping Equipment: ", prod2, "with the sum of quantity of: ", maxprod2
print "Outdoor Protection: ", prod3, "with the sum of quantity of: ", maxprod3
}

' WA_Sales_Products_2012-14.csv

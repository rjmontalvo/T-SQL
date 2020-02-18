SELECT firstname, lastname,
	CASE region
		WHEN 'WA' THEN 'Washington'
		ELSE 'England'
	END AS RegionSpelledOut,
	CASE 
		WHEN country = 'USA' THEN 'United States of America'
		WHEN country = 'UK' THEN 'United Kingdom'
	END CountrySpelledOut
FROM HR.Employees;
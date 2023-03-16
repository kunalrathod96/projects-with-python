-- Creating View to store data for later Vizualisations
CREATE VIEW Percent_Population_Vaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, 
dea.date) AS Rolling_People_Vaccinated
FROM covid.covid_death AS dea
JOIN covid.covid_vaccination AS vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3;
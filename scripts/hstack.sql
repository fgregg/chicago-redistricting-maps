SELECT
    ward,
    precinct,
    `JESUS 'CHUY' GARCIA` / cast(fifteen. `BALLOTS CAST` AS double) as garcia_15,
    `RAHM EMANUEL` / cast(fifteen. `BALLOTS CAST` AS double) as emanuel_15,
    fifteen. `WILLIE WILSON` / cast(fifteen. `BALLOTS CAST` AS double) as wilson_15,
    `ROBERT W. FIORETTI` / cast(fifteen. `BALLOTS CAST` AS double) as fioretti_15,
    `LORI LIGHTFOOT` / cast(nineteen. `BALLOTS CAST` AS double) as lightfoot_19,
    `TONI PRECKWINKLE` / cast(nineteen. `BALLOTS CAST` as double) as preckwinkle_19,
    `WILLIE L. WILSON` / cast(nineteen. `BALLOTS CAST` as double) as wilson_19,
    `SUSANA A. MENDOZA` / cast(nineteen. `BALLOTS CAST` as double) as mendoza_19,
    `AMARA ENYIA` / cast(nineteen. `BALLOTS CAST` as double) as enyia_19,
    `JERRY JOYCE` / cast(nineteen. `BALLOTS CAST` as double) as joyce_19,
    `GERY CHICO` / cast(nineteen. `BALLOTS CAST` as double) as chico_19,
    `PAUL VALLAS` / cast(nineteen. `BALLOTS CAST` as double) as vallas_19,
    `GARRY MCCARTHY` / cast(nineteen. `BALLOTS CAST` as double) as mccarthy_19,
    `LA SHAWN K. FORD` / cast(nineteen. `BALLOTS CAST` as double) as ford_19,
    `WILLIAM M. DALEY` / cast(nineteen. `BALLOTS CAST` as double) as daley_19,
    `NEAL SALES-GRIFFIN` / cast(nineteen. `BALLOTS CAST` as double) as griffin_19,
    `ROBERT 'BOB' FIORETTI` / cast(nineteen. `BALLOTS CAST` as double) as fioretti_19
FROM
    municipal_general_2015 AS fifteen
    INNER JOIN municipal_general_2019 AS nineteen USING (ward, precinct);

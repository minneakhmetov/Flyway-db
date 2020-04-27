create or replace function sum_array_func(one complex, two complex[])
    returns complex as
$$
    declare
        t complex;
begin
    FOREACH t IN ARRAY two LOOP
            one := sum_func(t, one);
    END loop;
    return one;
end;
$$ language plpgsql;

create or replace function sum_combine_array_func(one complex, two complex)
    returns complex as
$$
    declare result complex = (0, 0)::complex;
begin
    return (one.r + two.r, one.i + two.i)::complex;
end;
$$ language plpgsql;

create or replace function sum_final_array_func(num complex)
    returns complex as
$$
begin
    return num;
end;
$$ language plpgsql;

create aggregate complex_sum(complex[])
    (
    sfunc = sum_array_func,
    stype = complex,
    finalfunc = sum_final_array_func,
    initcond = '(0,0)',
    combinefunc = sum_combine_array_func,
    parallel = safe
    );


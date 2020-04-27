create type complex as
(
    r double precision,
    i double precision
);

create table complex_table (
    number complex
);

--------------

create or replace function sum_func(one complex, two complex)
    returns complex as
$$
begin
    return (one.r + two.r, one.i + two.i)::complex;
end;
$$ language plpgsql;

create or replace function sum_combine_func(one complex, two complex)
    returns complex as
$$
begin
    return (one.r + two.r, one.i + two.i)::complex;
end;
$$ language plpgsql;

create or replace function sum_final_func(num complex)
    returns complex as
$$
begin
    return num;
end;
$$ language plpgsql;

create aggregate complex_sum(complex)
    (
    sfunc = sum_func,
    stype = complex,
    finalfunc = sum_final_func,
    initcond = '(0,0)',
    combinefunc = sum_combine_func,
    parallel = safe
    );

----------------

create or replace function subtract_func(one complex, two complex)
    returns complex as
$$
begin
    return (one.r - two.r, one.i - two.i)::complex;
end;
$$ language plpgsql;

create or replace function subtract_combine_func(one complex, two complex)
    returns complex as
$$
begin
    return (one.r + two.r, one.i + two.i)::complex;
end;
$$ language plpgsql;

create or replace function subtract_final_func(num complex)
    returns complex as
$$
begin
    return num;
end;
$$ language plpgsql;

create aggregate complex_subtract(complex)
    (
    sfunc = subtract_func,
    stype = complex,
    finalfunc = subtract_final_func,
    initcond = '(0,0)',
    combinefunc = subtract_combine_func,
    parallel = safe
    );

-------------


create or replace function multi_func(one complex, two complex)
    returns complex as
$$
begin
    return (one.r * two.r - one.i * two.i, one.i * two.r + one.r * two.i)::complex;
end;
$$ language plpgsql;

create or replace function multi_combine_func(one complex, two complex)
    returns complex as
$$
begin
    return (one.r + two.r, one.i + two.i)::complex;
end;
$$ language plpgsql;

create or replace function multi_final_func(num complex)
    returns complex as
$$
begin
    return num;
end;
$$ language plpgsql;

create aggregate complex_multi(complex)
    (
    sfunc = multi_func,
    stype = complex,
    finalfunc = multi_final_func,
    initcond = '(1,0)',
    combinefunc = multi_combine_func,
    parallel = safe
    );

--------------------

create or replace function divide_func(one complex, two complex)
    returns complex as
$$
begin
    return ((one.r * two.r + one.i * two.i) / (two.r * two.r + two.i * two.i),
            (one.i * two.r - one.r * two.i) / (two.r * two.r + two.i * two.i))::complex;
end;
$$ language plpgsql;

create or replace function divide_combine_func(one complex, two complex)
    returns complex as
$$
begin
    return (one.r + two.r, one.i + two.i)::complex;
end;
$$ language plpgsql;

create or replace function divide_final_func(num complex)
    returns complex as
$$
begin
    return num;
end;
$$ language plpgsql;

create aggregate complex_divide(complex)
    (
    sfunc = divide_func,
    stype = complex,
    finalfunc = divide_final_func,
    initcond = '(1,0)',
    combinefunc = divide_combine_func,
    parallel = safe
    );

--------------------------------------------------
DO
$do$
    BEGIN
        FOR i IN 1..1000 LOOP
                insert into complex_table (number) values (((i + random() * 50000 + 1),(i + random() * 50000 + 1))::complex);
            END LOOP;
    END
$do$;


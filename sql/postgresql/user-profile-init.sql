--
-- Initialize the User Profile package
--
-- @author <a href="mailto:yon@openforce.net">yon@openforce.net</a>
-- @version $Id$
--

create function inline_1()
returns integer as '
DECLARE
	foo integer;
BEGIN
    PERFORM acs_rel_type__create_type(
        ''user_profile_rel'',
        ''Profiled User Membership'',
        ''Profiled User Memberships'',
        ''membership_rel'',
        ''user_profile_rels'',
        ''rel_id'',
        ''user_profile_rel'',
        ''profiled_group'',
        null,
        0,
        null,
        ''user'',
        null,
        0,
        1
    );

    select min(impl_id)
    into foo
    from acs_sc_impls
    where impl_name = ''user_profile_provider'';

    foo:= profiled_group__new(
	   foo,
	   ''Profiled Users''
    );

    PERFORM rel_segment__new(
        NULL,
	''rel_segment'',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
        ''Profiled Users'',
        foo,
        ''user_profile_rel'',
	NULL
    );

    return 0;
end;
' language 'plpgsql';

select inline_1();
drop function inline_1();

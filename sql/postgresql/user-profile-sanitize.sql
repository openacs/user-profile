--
-- Sanitize the User Profile package
--
-- @author <a href="mailto:yon@openforce.net">yon@openforce.net</a>
-- @version $Id$
--

create function inline_1()
returns integer as '
declare
    foo                         integer;
begin

    select min(segment_id)
    into foo
    from rel_segments
    where segment_name = ''Profiled Users'';

    perform rel_segment__delete(
        foo
    );

    select min(group_id)
    into foo
    from profiled_groups
    where profile_provider = (select min(impl_id)
                              from acs_sc_impls
                              where impl_name = ''user_profile_provider'');

    perform profiled_group__delete(
        foo
    );

    perform acs_rel_type__drop_type(
        ''user_profile_rel'',
        ''t''
    );

    return 0;

end;
' language 'plpgsql';

select inline_1();
drop function inline_1();

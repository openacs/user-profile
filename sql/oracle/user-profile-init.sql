--
-- Initialize the User Profile package
--
-- @author <a href="mailto:yon@openforce.net">yon@openforce.net</a>
-- @version $Id$
--

declare
    foo                         integer;
begin

    acs_rel_type.create_type(
        rel_type => 'user_profile_rel',
        supertype => 'membership_rel',
        pretty_name => 'Profiled User Membership',
        pretty_plural => 'Profiled User Memberships',
        package_name => 'user_profile_rel',
        table_name => 'user_profile_rels',
        id_column => 'rel_id',
        object_type_one => 'profiled_group',
        role_one => null,
        min_n_rels_one => 0,
        max_n_rels_one => null,
        object_type_two => 'user',
        role_two => null,
        min_n_rels_two => 0,
        max_n_rels_two => 1
    );

    select min(impl_id)
    into foo
    from acs_sc_impls
    where impl_name = 'user_profile_provider';

    foo := profiled_group.new(
        profile_provider => foo,
        group_name => 'Profiled Users'
    );

    foo := rel_segment.new(
        segment_name => 'Profiled Users',
        group_id => foo,
        rel_type => 'user_profile_rel'
    );

end;
/
show errors

--
-- Create the User Profile package
--
-- @author <a href="mailto:yon@openforce.net">yon@openforce.net</a>
-- @version $Id$
--

create table user_profile_rels (
    rel_id                      constraint up_rels_rel_id_fk
                                references membership_rels (rel_id)
                                constraint user_profile_rels_pk
                                primary key
);

@@ user-profile-provider-create.sql
@@ user-profile-init.sql
@@ user-profile-package-create.sql

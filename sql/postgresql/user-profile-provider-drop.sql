--
-- Implementation of the profile provider interface for users.
--
-- @author <a href="mailto:yon@openforce.net">yon@openforce.net</a>
-- @version $Id$
--

begin

    -- drop the binding between this implementation and the interface it
    -- implements.
    select acs_sc_binding__delete (
        'profile_provider',
        'user_profile_provider'
    );

    -- drop the bindings to the method implementations

    -- name method
    select acs_sc_impl_alias__delete (
        'profile_provider',
        'user_profile_provider',
        'name'
    );

    -- prettyName method
    select acs_sc_impl_alias__delete (
        'profile_provider',
        'user_profile_provider',
        'prettyName'
    );

    -- render method
    select acs_sc_impl_alias__delete (
        'profile_provider',
        'user_profile_provider',
        'render'
    );

    -- drop the implementation
    select acs_sc_impl__delete(
        'profile_provider',
        'user_profile_provider'
    );

end;

define(["application"], function(App) {
  App.EditProfileModalView = Ember.View.extend({
    actions: {
      save: function () {
        var person = this.get('controller.person')
          , personData = this.get('controller.personData')
          , newProperties = personData.getProperties([
              'name', 'title', 'bio', 'website', 'github', 'twitter'
            ]);

        /* Hide modal. */
        this.$('#edit_profile_modal').modal('hide');

        $.ajax({
          url: App.API_BASE_URL + '/profile',
          type: 'put',
          data: {
            person: newProperties
          }
        }).done(function () {
          person.setProperties(newProperties);
        });
      }
    },

    templateName: 'views/edit_profile_modal'
  });
});

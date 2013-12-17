{{#form-for model}}
  {{input name class="edit-name" placeholder="Employee Name"}}
  <div class="picture">
    <img {{ bind-attr src="avatar.small"}}/>
  </div>
  {{input avatarData class="avatar-picker" as="file" label="Choose Avatar"}}
  <div class="edit-role">
    {{input role
            as="select"
            prompt="Employee Role"
            collection="App.EMPLOYEE_ROLES"
            selection="role"
            optionValuePath="content"
            optionLabelPath="content"
    }}
  </div>
  {{#if isNew}}
    <div class="office">
      {{view Ember.Select
             content=selectableOffices
             selection=office
             prompt="Office"
             optionValuePath="content.id"
             optionLabelPath="content.name"}}
    </div>
  {{/if}}
  {{#unless isNew}}
    <div class="office">{{office.name}}</div>
  {{/unless}}
  <div class="info">
    <div class="start-date">
      <label for="startDate"> Start Date </label>
      {{edit-date name="startDate" class="date" value=formStartDate}}
    </div>
  </div>
  <div class="info">
    <div class="end-date">
      <label for="endDate"> End Date </label>
        {{edit-date name="endDate" class="date" value=formEndDate}}
    </div>
  </div>
  <div class="info">
    {{#input email class="edit-email"}}
      {{input-field email}}
      <i>&#9993;{{label-field email text=" "}}</i>
      {{error-field email}}
  </div>
  {{/input}}
  <div class="info">
    {{#input twitter class="edit-twitter"}}
    {{input-field twitter}}
    <i class="social">&#62217;{{label-field twitter text=" "}}</i>
    {{error-field twitter}}
  </div>
  {{/input}}
  <div class="info">
    {{#input github class="edit-github"}}
    {{input-field github}}
    <i class="social">&#62208;{{label-field gituhub text=" "}}</i>
    {{error-field github}}
  </div>
  {{/input}}
  <div class="unsellable">
  <h3 class="overhead">Overhead</h3>
   {{input unsellable as="checkbox" checked="checked"}}
  </div>
  <div {{action 'save'}} class="confirm-button">
    <i>&#10003;</i>
      {{#if isNew}}
        Create Neon
      {{/if}}
      {{#unless isNew}}
        Confirm Edits
      {{/unless}}
  </div>
  <div class="return-button">
    <i>&#11013;</i>
    {{#link-to 'people'}}Return to List{{/link-to}}
  </div>
{{/form-for}}


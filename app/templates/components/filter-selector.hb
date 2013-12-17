<div class="filter-selector">
  {{#if isOpen}}
    <div {{action 'toggleOpen' bubbles=false}}>{{selectedList}}</div>
    <ul class="options">
    <div class="filter-options">
      <div class="reset" {{action 'reset' bubbles=false}}>
        <p>Reset Filter</p>
        <span>&#10226;</span>
      </div>
      <div class="confirm-choice" {{action 'toggleOpen' bubbles=false}}>
        <span>&#10003;</span>
        <p>Confirm Choice</p>
      </div>
    </div>
      {{#each thing in options}}
        {{#if thing.visible}}
          {{#if thing.selected}}
            <li class="option selected" {{action 'unselect' thing bubbles=false}}>{{thing.displayName}}</li>
          {{else}}
            <li class="option" {{action 'select' thing bubbles=false}}>{{thing.displayName}}</li>
          {{/if}}
        {{/if}}
      {{/each}}
    </ul>
  {{else}}
    <div {{action 'toggleOpen' bubbles=false}} class="selected-list">
      {{selectedList}}
    </div>
  {{/if}}
</div>

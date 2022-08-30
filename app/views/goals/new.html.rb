<div class="container">
  <%= simple_form_for @goal do |f| %>
    <%= f.input :name %>
    <%= f.input :description %>
    <%= f.input :category %>
    <%= f.input :start_date %>
    <%= f.input :end_date %>
    <%= f.button :submit, class: 'btn btn-success' %>
  <% end %>
</div>

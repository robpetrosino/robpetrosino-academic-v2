---
# Leave the homepage title empty to use the site title
title: Roberto Petrosino
date:
type: landing

sections:
  - block: about.biography
    id: bio
    content:
      title:
      # Choose a user profile to display (a folder name within `content/authors/`)
      username: robpetro
  - block: people
    id: about
    content:
      title: Collaborators
      user_groups:
        - Collaborators
      sort_by: Params.last_name
      sort_ascending: true
    design:
      # Show user's social networking links? (true/false)
      show_social: false
      # Show user's interests? (true/false)
      show_interests: false
      # Show user's role?
      show_role: false
      # Show user's organizations/affiliations?
      show_organizations: true
  - block: features
    content:
      title: Skills
      items:
        - name: R
          icon: r-project
          icon_pack: fab
        - name: javascript
          icon: fab fa-js
          icon_pack: fab
        - name: python
          icon: fab fa-python
          icon_pack: fab
        - name: HTML+CSS
          icon: fas fa-code
          icon_pack: fas
        - name: LaTeX
          icon: fas fa-laptop-code
          icon_pack: fas
        - name: Data analysis
          icon: chart-line
          icon_pack: fas
  # - block: portfolio
  #   id: projects
  #   content:
  #     title: Research topics
  #     filters:
  #       folders:
  #         - projects
  #     sort_by: 'Title'
  #     sort_ascending: true
  #     # Default filter index (e.g. 0 corresponds to the first `filter_button` instance below).
  #     default_button_index: 0
  #     # Filter toolbar (optional).
  #     # Add or remove as many filters (`filter_button` instances) as you like.
  #     # To show all items, set `tag` to "*".
  #     # To filter by a specific tag, set `tag` to an existing tag name.
  #     # To remove the toolbar, delete the entire `filter_button` block.
  #     buttons:
  #       - name: all
  #         tag: "*"
  #       - name: morphology
  #         tag: morphology
  #       - name: decomposition
  #         tag: decomposition
  #       - name: processing
  #         tag: processing
  #       - name: methods
  #         tag: methods
  #   design:
  #     # Choose how many columns the section has. Valid values: '1' or '2'.
  #     columns: '2'
  #     view: compact
  #     # For Showcase view, flip alternate rows?
  #     #flip_alt_rows: false
  # - block: collection
  #   id: publication
  #   content:
  #     title: Papers
  #     sort_by: 'Date'
  #     count: 0
  #     offset: 1
  #     filters:
  #       folders:
  #         - publication
  #   design:
  #     columns: '2'
  #     view: citation
---

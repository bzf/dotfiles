let g:projectionist_heuristics = {
      \ "app/|spec/": {
      \     "app/*.rb": { "alternate": "spec/{}_spec.rb" },
      \     "spec/*_spec.rb": { "alternate": "app/{}.rb" },
      \   }
      \ }

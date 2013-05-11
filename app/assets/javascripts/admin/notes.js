$(function() {
  'use strict';

  function Ace() {
    var self = this;

    self.$bodyInput = $('input#note_body');
    self.editor = ace.edit('note-body');

    self.editor.setTheme('ace/theme/twilight');
    self.editor.getSession().setMode('ace/mode/markdown');
    self.editor.getSession().setTabSize(2);
    self.editor.getSession().setUseSoftTabs(true);

    var body = self.$bodyInput.val();

    if (body) {
      self.editor.setValue(body);
    }

    Ace.prototype.setNoteBody = function(body) {
      self.$bodyInput.val(body);
    };

    self.editor.getSession().on('change', function(e) {
      self.setNoteBody(self.editor.getValue());
    });
  }

  if ($('#admin_notes').length) {
    new Ace();
  }
});

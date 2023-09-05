import { Controller } from "@hotwired/stimulus"
import TomSelect from 'tom-select'


// Connects to data-controller="autocomplete"
export default class extends Controller {
  connect() {
    console.log("connected")
    new TomSelect(this.element,{
      persist: false,
      createOnBlur: true,
      create: false,
      multiple:true,
      plugins: {
        remove_button:{
          title:'Remove this item',
        }
      },
      onDelete: function(values) {
        return confirm(values.length > 1 ? 'Are you sure you want to remove these ' + values.length + ' items?' : 'Are you sure you want to remove "' + values[0] + '"?');
      }
    });
  }


}

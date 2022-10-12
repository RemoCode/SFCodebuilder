import { LightningElement } from 'lwc';

export default class NewCBComponent extends LightningElement {
   greeting = 'Great going learning Code Builder!';
   changeHandler(event) {
       this.greeting = event.target.value;
   }
}
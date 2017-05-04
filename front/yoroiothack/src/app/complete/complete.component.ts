import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-complete',
  templateUrl: './complete.component.html',
  styleUrls: ['./complete.component.sass']
})
export class CompleteComponent implements OnInit {

  qrCodePath: string;

  constructor() {
    this.ngOnInit();
  }

  ngOnInit() {
    this.qrCodePath = `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCA.. `;
  }

}

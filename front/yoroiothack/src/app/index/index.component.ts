import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.sass']
})
export class IndexComponent implements OnInit {

  private title: string;

  constructor() {
    this.title = `app 居酒屋！`;
  }

  ngOnInit() {
  }

}

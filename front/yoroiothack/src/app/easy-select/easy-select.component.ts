import { Component, OnInit } from '@angular/core';
import {MenuService} from "../menu.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-easy-select',
  templateUrl: './easy-select.component.html',
  styleUrls: ['./easy-select.component.sass']
})
export class EasySelectComponent implements OnInit {

  public headcount: number[];
  public selectedHeadCount: number;

  public budget: number[];
  public selectedBudget: number;

  public style: string[];
  public selectedStyle: string;

  public must: string[];
  public selectedMust: string[];

  constructor(private menuService: MenuService,
              private router: Router) {
    this.headcount = [1,2,3,4,5,6];
    this.selectedHeadCount = 1;

    this.budget = [1000, 1500, 2000, 2500, 3000, 4000, 4500, 5000];
    this.selectedBudget = 2500;

    this.style = [`サッパリ`, `がっつり`, `おもしろ`, `女子会`];
    this.selectedStyle = `おもしろ`;

    this.must = [`つまみ`, `サラダ`, `串もの`, `刺し身`];
    this.selectedMust = [];
  }

  ngOnInit() {
  }

  onChangeHeadCount(index: number): void {
    this.selectedHeadCount = this.headcount[index];
  }

  onChangeBudget(index: number): void {
    this.selectedBudget = this.budget[index];
  }

  onChangeStyle(index: number): void {
    this.selectedStyle = this.style[index];
  }

  onSelectMust(index: number): void {
    this.selectedMust.push(this.must[index]);
  }

  onClickAsk(): void {
    this.menuService.askMenu({
      headCount: this.selectedHeadCount,
      budget: this.selectedBudget,
      style: this.selectedStyle,
      must: this.selectedMust,
    }).then((response) => {
      if (response) {
        this.router.navigate(['/detail']);
      }
    })
  }

}

//
//  WeatherViewController.swift
//  Weather
//
//  Created by Maxim  on 3/19/18.
//  Copyright © 2018 Maxim. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var forecast: Forecast?
    
    @IBOutlet weak var dayCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getWeather()
    }
    
    private func getWeather() {
      
        GetWeather.fiveDaysForecast { (forecast) in
            self.forecast = forecast
            
            DispatchQueue.main.async {
                self.dayCollectionView.reloadData()
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupView() {
        let dayNib = UINib(nibName: "DayCollectionViewCell", bundle: nil)
        dayCollectionView.register(dayNib, forCellWithReuseIdentifier: "DayCollectionViewCell")
        
        let nib = UINib(nibName: "ForecastTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ForecastTableViewCell")
    }
    
    fileprivate func setupCell(forecast: Forecast?, cell: DayCollectionViewCell, indexPath: IndexPath) {
        
        guard let forecast = forecast else { return }
        
        cell.cityLabel.text = forecast.city.name
        cell.currentTempLabel.text = "\(Int(forecast.list[indexPath.row].main.temp ?? 0))"  + " °C"
        cell.minTempLabel.text = "\(Int(forecast.list[indexPath.row].main.temp_min ?? 0.0))"
        cell.maxTemplabel.text = "\(Int(forecast.list[indexPath.row].main.temp_max ?? 0.0))"
        cell.dateLabel.text = forecast.list[indexPath.row].date

    }

}

extension WeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let forecast = forecast { return forecast.list.count } else { return 0 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = dayCollectionView.dequeueReusableCell(withReuseIdentifier: "DayCollectionViewCell", for: indexPath) as? DayCollectionViewCell else {
            fatalError("Cell not found")
        }
        
        setupCell(forecast: forecast, cell: cell, indexPath: indexPath)
        
        return cell
        
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let height: CGFloat = dayCollectionView.frame.size.height - 24
        let widht: CGFloat = dayCollectionView.frame.size.width
        
        return CGSize(width: widht, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }

}

extension WeatherViewController: UICollectionViewDelegate {

}

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let forecast = forecast { return forecast.list.count } else { return 1 }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell", for: indexPath) as! ForecastTableViewCell
        
        if let forecast = forecast {
            cell.dateLabel.text = forecast.list[indexPath.row].date
            cell.tempLabel.text = "\(Int(forecast.list[indexPath.row].main.temp ?? 0))"  + " °C"
        }
        
        return cell
    }
    
    
}

extension WeatherViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dayCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}







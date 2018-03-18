//
//  MovieViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 17.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

func movieViewModel(movie: Movie) -> ViewModel {
    var data: [ViewModel.LabelValue] = []
    
    data.append((label: "Episode", value: RomanValue(value: movie.episode), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Opening", value: OpeningCrawlValue(value: movie.opening, name: movie.name, episode: movie.episode), cellIdentifier: OpeningCrawlDataCell.reuseIdentifier))
    data.append((label: "Director", value: StringValue(value: movie.director), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Producer", value: StringValue(value: movie.producer), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Release date", value: StringValue(value: movie.releaseDate), cellIdentifier: DataCell.reuseIdentifier))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Characters", collection: movie.characters, resource: SWCharacterResource()))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Starships", collection: movie.starships, resource: StarshipResource()))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Vehicles", collection: movie.vehicles, resource: VehicleResource()))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Planets", collection: movie.planets, resource: PlanetResource()))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Species", collection: movie.species, resource: SpeciesResource()))

    return ViewModel(name: movie.name, data: data)
}

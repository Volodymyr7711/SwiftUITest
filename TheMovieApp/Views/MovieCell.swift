//
//  MovieCell.swift
//  TheMovieApp
//
//  Created by Volodymyr Mendyk on 01.03.2021.
//

import SwiftUI

struct MovieCell: View {
    
    var movie: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            moviePoster
            
            VStack(alignment: .leading, spacing: 10) {
                    movieTitle
                        .frame(width: 180)
                HStack{
                    movieVotes
                    movieReleaseData
                }
               movieOverview
                .frame(width: 170)
            }
            
        }
    }

    private var moviePoster: some View {
            AsyncImage(url: URL(string: movie.posterPath)!) {
                Rectangle().foregroundColor(Color.gray.opacity(0.4))
            } image: { (img) -> Image in
                Image(uiImage: img)
                    .resizable()
            }
            .frame(width: 100, height: 160)
            .animation(.easeInOut(duration: 0.5))
            .transition(.opacity)
            .scaledToFill()
            .cornerRadius(15)
            .shadow(radius: 15)
        }
    
    private var movieTitle: some View {
        Text(movie.titleWithLanguage)
            .font(.system(size: 17))
            .bold()
            .foregroundColor(.black)
    }
    
    private var movieVotes: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(movie.voteAverage))
                .stroke(Color.red, lineWidth: 4)
                .frame(width: 56)
                .rotationEffect(.degrees(-90))
            Circle()
                .trim(from: 0, to: 1)
                .stroke(Color.red.opacity(0.2), lineWidth: 4)
                .frame(width: 60)
                .rotationEffect(.degrees(-90))
            Text(String.init(format: "%0.2f", movie.vote_average ?? 0.0))
                .foregroundColor(.pink)
                .font(.subheadline)
        }.frame(height: 70)
    }
    
    private var movieReleaseData: some View {
        Text(movie.release_date ?? "")
            .foregroundColor(.black)
            .bold()
            .font(.subheadline)
    }

    private var movieOverview: some View {
        Text(movie.overview ?? "")
            .font(.body)
            .foregroundColor(Color.gray)
    }
}

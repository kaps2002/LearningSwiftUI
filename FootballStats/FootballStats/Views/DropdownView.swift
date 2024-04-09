//
//  DropdownView.swift
//  FootballStats
//
//  Created by Roro on 08/04/24.
//

import SwiftUI

struct DropdownView: View {
    var hint: String
    var options: [String]
    var anchor: Anchor = .bottom
    var maxWidth: CGFloat = 120
    var cornerRadius: CGFloat = 15
    @Binding var selection: String?
    @State private var showOptions: Bool = false
    @Environment(\.colorScheme) private var scheme
    @State private var viewModel = FootballViewModel()
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(selection ?? hint)
                        .foregroundStyle(selection == "Select" ? .gray : .blue)
                        .fontWeight(.semibold)
                    
                    Spacer(minLength: 0)
                    Image(systemName: "chevron.down")
                        .font(.title3)
                        .foregroundStyle(.gray)
                        .rotationEffect(.init(degrees: showOptions ? -90 : 0))
                }
                .padding(.horizontal, 15)
                .frame(width: size.width, height: size.height, alignment: .center)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy(duration: 0.5)) {
                        showOptions.toggle()
                    }
                }
                
                if showOptions {
                    OptionsView()
                }
            }
            .background((scheme == .dark ? Color.black : Color.white).shadow(.drop(color: .primary, radius: 4)), in: .rect(cornerRadius: cornerRadius))
            
        }
        .frame(width: maxWidth, height: 35)
    }
    
    @ViewBuilder
    func OptionsView() -> some View {
        VStack(spacing: 10) {
            ForEach(options, id: \.self) { option in
                HStack(spacing: 0) {
                    Text(option)
                        .lineLimit(1)
                    Spacer(minLength: 0)
                    
                    Image(systemName: "checkmark")
                        .opacity(selection == option ? 1: 0)
                }
                .padding(5)
                .foregroundStyle(selection == option ? .blue : .gray)
                .fontWeight(.semibold)
                .frame(height: 15)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        showOptions = false
                    }
                }
                
            }
        }
        .padding(.horizontal, 10)
    }
    
    enum Anchor {
        case top
        case bottom
    }
}

#Preview {
    DropdownView(hint: "Select", options: ["2015","2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"], selection: .constant(nil))
}

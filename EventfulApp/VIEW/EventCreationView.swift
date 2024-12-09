//
//  EventCreationView.swift
//  EventfulApp
//
//  Created by Lilli Cain on 12/9/24.
//

import SwiftUI

struct EventCreationView: View {
    @State private var viewModel = EventCreationViewModel()
    @State private var showingPostAlert: Bool = false
    @State private var showingCancelAlert: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            eventInfo
            cancelSaveButtons
        }
        .alert("Confirm Post", isPresented: $showingPostAlert) {
            Button("Post", role: .destructive) {
                viewModel.saveEvent()
                dismiss()
            }
            Button("Edit", role: .cancel) { }
        } message: {
            Text("Are you sure you want to post this event?")
        }
        .alert("Confirm Cancel", isPresented: $showingCancelAlert) {
            Button("Yes", role: .destructive) {
                dismiss()
            }
            Button("No", role: .cancel) { }
        } message: {
            Text("Are you sure you want to cancel? Unsaved changes will be lost.")
        }
        .onChange(of: viewModel.fieldsChanged) {
            viewModel.validateFields()
        }
    }
}

extension EventCreationView {
    
    var eventInfo: some View {
        Group {
            Section {
                HStack {
                    TextField("Name", text: $viewModel.name)
                        .autocorrectionDisabled()
                    Image(systemName: viewModel.isNameFilled ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(viewModel.isNameFilled ? .green : .red)
                }
                
                HStack {
                    TextField("Address", text: $viewModel.location)
                        .autocorrectionDisabled()
                    Image(systemName: viewModel.isLocationFilled ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(viewModel.isLocationFilled ? .green : .red)
                }
                
                HStack {
                    TextField("Description", text: $viewModel.description)
                        .autocorrectionDisabled()
                    Image(systemName: viewModel.isDescriptionFilled ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(viewModel.isDescriptionFilled ? .green : .red)
                }
                
                HStack {
                    TextField("Cost", text: $viewModel.cost)
                        .keyboardType(.decimalPad)
                    Image(systemName: viewModel.isCostFilled ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(viewModel.isCostFilled ? .green : .red)
                }
            } header: {
                Text("Event Details")
            }
            
            Section {
                HStack {
                    DatePicker("Start Date", selection: $viewModel.startDate, displayedComponents: [.date, .hourAndMinute])
                        .padding(.horizontal)
                    Image(systemName: viewModel.isStartDateValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(viewModel.isStartDateValid ? .green : .red)
                }
                
                HStack {
                    DatePicker("End Date", selection: $viewModel.endDate, displayedComponents: [.date, .hourAndMinute])
                        .padding(.horizontal)
                    Image(systemName: viewModel.isEndDateValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(viewModel.isEndDateValid ? .green : .red)
                }
            } header: {
                Text("Date & Time")
            }
            
            Section {
                Picker("Age Restriction", selection: $viewModel.ageRestriction) {
                    ForEach(viewModel.restrictions, id: \.self) { restriction in
                        Text(restriction)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Age Restriction")
            }
        }
    }
    
    var cancelSaveButtons: some View {
        HStack {
            Button(action: {
                showingCancelAlert = true
            }) {
                Text("Cancel")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            
            Button(action: {
                showingPostAlert = true
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.buttonDisabled ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(viewModel.buttonDisabled)
        }
    }
}

#Preview {
    EventCreationView()
}

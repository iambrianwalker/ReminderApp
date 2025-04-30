import SwiftUI

struct AddReminderView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ReminderViewModel

    @State private var title = ""
    @State private var dueDate = Date()

    var body: some View {
        NavigationView {
            Form {
                TextField("Reminder Title", text: $title)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
            }
            .navigationTitle("New Reminder")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newReminder = Reminder(title: title, dueDate: dueDate)
                        viewModel.addReminder(newReminder)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(title.isEmpty)
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

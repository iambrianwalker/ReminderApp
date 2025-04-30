import SwiftUI

struct ReminderListView: View {
    @StateObject var viewModel = ReminderViewModel()
    @State private var showingAddReminder = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.reminders) { reminder in
                    ReminderRowView(reminder: reminder)
                }
                .onDelete(perform: viewModel.deleteReminder)
            }
            .navigationTitle("Reminders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddReminder.toggle() }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddReminder) {
                AddReminderView(viewModel: viewModel)
            }
        }
    }
}

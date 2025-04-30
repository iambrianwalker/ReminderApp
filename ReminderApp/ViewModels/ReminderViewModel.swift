import Foundation

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = [] {
        didSet {
            saveReminders()
        }
    }

    private let key = "SavedReminders"

    init() {
        loadReminders()
    }

    func addReminder(_ reminder: Reminder) {
        reminders.append(reminder)
    }

    func deleteReminder(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
    }

    private func saveReminders() {
        if let data = try? JSONEncoder().encode(reminders) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func loadReminders() {
        if let data = UserDefaults.standard.data(forKey: key),
           let saved = try? JSONDecoder().decode([Reminder].self, from: data) {
            reminders = saved
        }
    }
}

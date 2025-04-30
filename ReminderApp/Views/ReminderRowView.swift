import SwiftUI

struct ReminderRowView: View {
    var reminder: Reminder

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(reminder.title)
                    .font(.headline)
                Text("Due: \(reminder.dueDate.formatted(date: .abbreviated, time: .shortened))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

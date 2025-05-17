import SwiftUI

struct StageRowView: View {
    let stage: RegistrationStage
    let isLast: Bool
    let nextStageCompleted: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 12) {
                statusIndicator
                contentView
            }
        }
    }
    
    private var statusIndicator: some View {
        VStack(spacing: 6) {
            Circle()
                .fill(stage.isCompleted ? Color.green : Color.gray.opacity(0.3))
                .frame(width: 20, height: 20)
                .overlay(indicatorOverlay)
            
            if !isLast {
                Rectangle()
                    .fill(stage.isCompleted ? Color.green : Color.gray.opacity(0.3))
                    .frame(width: 2, height: 26)
            }
        }
    }
    
    private var indicatorOverlay: some View {
        Group {
            if stage.isCompleted {
                if nextStageCompleted {
                    Image(systemName: "checkmark")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                } else {
                    Circle()
                        .strokeBorder(Color.white, lineWidth: 3)
                        .frame(width: 6, height: 6)
                }
            } else {
                Circle()
                    .strokeBorder(Color.white, lineWidth: 3)
                    .frame(width: 6, height: 6)
            }
        }
    }
    
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stage.name)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(stage.isCompleted ? .black : .gray)
            
            HStack {
                if !stage.range.isEmpty {
                    Text("\(stage.range) - ")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(stage.isCompleted ? .black : .gray)
                }
                
                Text(stage.isCompleted ? stage.dateRange : "Coming soon")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.top, 2)
            }
        }
        .padding(.bottom, 24)
    }
}

#Preview("子コンポーネントの.frame()で左寄せを指定") {
    VStack(spacing: 0) {
        StageRowView(
            stage: RegistrationStage(name: "Form Submission", range: "", dateRange: "22 Oct - 24 Oct", isCompleted: true),
            isLast: false,
            nextStageCompleted: true
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        StageRowView(
            stage: RegistrationStage(name: "Document Review", range: "", dateRange: "07 Nov - 11 Nov", isCompleted: true),
            isLast: false,
            nextStageCompleted: true
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        StageRowView(
            stage: RegistrationStage(name: "Verification", range: "", dateRange: "11 Nov 2024", isCompleted: true),
            isLast: true,
            nextStageCompleted: false
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding()
    .background(Color(.systemGroupedBackground))
    
    /*
     .frame の役割について
         SwiftUI の .frame モディファイアは、そのビュー自身のサイズや位置の"希望"を
         親ビューに伝える。つまり、.frame を付けたコンポーネント自身の「枠」を広げたり、
         親の中での配置（alignment）を指定する。
     
         Jetpack Compose は以下のように基本的に親が子の配置を指定するが、
         Modifier.align で子側でも配置を指定することが可能。
         .frame(alignment: .leading) は Modifier.align に似ている。
         
         Column(
             horizontalAlignment = Alignment.Start
         ) {
             Text("左寄せ")
             Text("中央寄せ", modifier = Modifier.align(Alignment.CenterHorizontally))
         }
     */
}

#Preview("VStackに左寄せを指定") {
    VStack(alignment: .leading, spacing: 0) {
        StageRowView(
            stage: RegistrationStage(name: "Form Submission", range: "", dateRange: "22 Oct - 24 Oct", isCompleted: true),
            isLast: false,
            nextStageCompleted: true
        )
        StageRowView(
            stage: RegistrationStage(name: "Document Review", range: "", dateRange: "07 Nov - 11 Nov", isCompleted: true),
            isLast: false,
            nextStageCompleted: true
        )
        StageRowView(
            stage: RegistrationStage(name: "Verification", range: "", dateRange: "11 Nov 2024", isCompleted: true),
            isLast: true,
            nextStageCompleted: false
        )
    }
    .frame(maxWidth: .infinity)
    .padding(16)
    .background(Color(.systemGroupedBackground))
    .border(Color.red, width: 2)
}


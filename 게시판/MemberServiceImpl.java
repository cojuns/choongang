import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class MemberServiceImpl implements MemberService {

    private static Member loginMember = null;
    private static final Scanner sc = new Scanner(System.in);
    private static final List<Member> memberList = new ArrayList<>();
    private static final List<Board> boardList = new ArrayList<>();

    @Override
    public void init() {
        System.out.print(
                "[1] Sign in    [2] Delete Member  [3] Show Member\n" +
                "[4] Login      [5] Logout\n" +
                "[6] New Board  [7] Show BoardList\n" +
                "[0] EXIT\n" +
                ">> ");
        String menu = sc.nextLine();

        if (menu.equals("1")) signIn();
        else if (menu.equals("2")) delMember();
        else if (menu.equals("3")) showMember();
        else if (menu.equals("4")) login();
        else if (menu.equals("5")) logout();
        else if (menu.equals("6")) newBoard();
        else if (menu.equals("7")) searchBoard();
        else if (menu.equals("0")) System.exit(0);
    }

    @Override
    public void signIn() {
        System.out.print("userName? ");
        String name = sc.nextLine();
        System.out.print("Password? ");
        String pwd = sc.nextLine();
        Member member = new Member(name, pwd);
        memberList.add(member);
        System.out.println(member.getMemberId() + "(" + member.getUserName() + ")가 생성되었습니다.");
    }

    @Override
    public void delMember() {
        System.out.print("userName? ");
        String id = sc.nextLine();
        System.out.print("password? ");
        String pwd = sc.nextLine();
        if (findById(id) == null) {
            System.out.println("존재하지 않는 아이디입니다.");
        } else {
            if (findById(id).getPassword().equals(pwd)) {
                memberList.remove(findById(id));
                System.out.println(findById(id)+ " 삭제 되었습니다.");
            } else {
                System.out.println("비밀번호를 확인해주세요.");
            }
        }
    }

    @Override
    public void showMember() {
        for (Member member : memberList) {
            System.out.println(member.toString());
        }
    }

    @Override
    public void login() {
        System.out.print("userName: ");
        String id = sc.nextLine();
        System.out.print("password: ");
        String pwd = sc.nextLine();
        if (findById(id) == null) {
            System.out.println("존재하지 않는 아이디입니다.");
        } else {
            if (findById(id).getPassword().equals(pwd)) {
                loginMember = findById(id);
                System.out.println(loginMember + "님, 환영합니다.");
            } else {
                System.out.println("비밀번호를 확인해주세요.");
            }
        }
    }

    @Override
    public void logout() {
        if (loginMember == null) {
            System.out.println("로그인 상태가 아닙니다.");
        } else {
            loginMember = null;
            System.out.println("로그아웃 되었습니다.");
        }
    }

    @Override
    public void newBoard() {
        if (loginMember == null) {
            System.out.println("로그인이 필요한 서비스입니다.");
        } else {
            System.out.print("title: ");
            String title = sc.nextLine();
            System.out.print("content: ");
            String content = sc.nextLine();
            Board board = new Board(title, loginMember, content);
            boardList.add(board);
            System.out.println(board.getBoardID() + "번 게시글이 생성되었습니다.");
        }
    }

    @Override
    public void searchBoard() {
        try {
            if (boardList.size() == 0) {
                System.out.println("게시글이 존재하지 않습니다.");
            } else {
                System.out.print("검색할 작성자 ID: ");
                int userId = sc.nextInt();
                for (Board i : boardList) {
                    if (i.getMember().getMemberId() == userId) {
                        System.out.println(i);
                    }
                }
            }
        } catch (InputMismatchException e) {
            System.out.println("작성자 ID는 숫자여야만 합니다.");
        }
    }

    @Override
    public Member findById(String id) {
        for (Member i : memberList) {
            if (i.getUserName().equals(id)) {
                return i;
            }
        }
        return null;
    }
}

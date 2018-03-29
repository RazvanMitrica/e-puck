function [x] = mas(epic)

    %[epic] = updateDef(epic, 'odom', 1)
%     [epic] = activate(epic, 'pos');
%     [epic] = activate(epic, 'odom');
%     [epic] = activate(epic, 'pos');
    
   % epic = set(epic,'odom',[epic.value.odom(1) epic.value.odom(2) epic.value.odom(3)]);
      %  [epic.value.odom(1) epic.value.odom(2) epic.value.odom(3);
    epic = updateOdometry(epic);
    %epic.value.pos(1)
    x = get(epic,'odom');
    epic = update(epic);
end
%epic = disconnect(epic);
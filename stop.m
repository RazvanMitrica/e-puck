function [] = stop(epic)
epic = set(epic, 'speed', [0 0]);
epic = update(epic);
end
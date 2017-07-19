package morozov.services.techService;

import morozov.dto.GroupDTO;

import java.util.List;


public interface GroupTechService {

    void saveGroup(GroupDTO groupDTO);

    List<GroupDTO> findAllGroups();

    void deleteGroup(Long id);

    GroupDTO findGroup(Long id);
}

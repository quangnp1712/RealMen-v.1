package com.realman.becore.repository.database.schedule;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.realman.becore.enums.EShift;
import com.realman.becore.repository.database.recept_schedule.ReceptScheduleEntity;
import com.realman.becore.repository.database.staff_schedule.StaffScheduleEntity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "schedule")
public class ScheduleEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private EShift shift;
    @Temporal(TemporalType.DATE)
    private Date workingDate;
    @Temporal(TemporalType.TIME)
    private Date open;
    @Temporal(TemporalType.TIME)
    private Date close;
    @Min(value = 5, message = "Một ca phải có ít nhất 5 người")
    @Max(value = 15, message = "Một ca tối đa chỉ có 15 người")
    private Integer resourcesRequirement;
    @OneToMany(mappedBy = "schedule")
    private List<StaffScheduleEntity> staffScheduleEntities;
    @OneToMany(mappedBy = "schedule")
    private List<ReceptScheduleEntity> receptScheduleEntities;
}
